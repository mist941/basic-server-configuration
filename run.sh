#!/bin/bash
set -a
source .env
set +a

# Create logs directory if it doesn't exist
mkdir -p logs

# Generate timestamp for this run
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
LOG_FILE="logs/ansible_run_${TIMESTAMP}.log"
REPORT_FILE="logs/ansible_report_${TIMESTAMP}.html"

# Run Ansible playbook and capture output
echo "Starting Ansible playbook execution at $(date)"
ansible-playbook -i inventory.ini playbook.yml | tee "${LOG_FILE}"
ANSIBLE_STATUS=$?

# Generate HTML report
echo "Generating HTML report..."
cat > "${REPORT_FILE}" << EOF
<!DOCTYPE html>
<html>
<head>
    <title>Ansible Execution Report - ${TIMESTAMP}</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; }
        h1 { color: #333; }
        .success { color: green; }
        .failure { color: red; }
        .section { margin-bottom: 20px; }
        pre { background-color: #f5f5f5; padding: 10px; border-radius: 5px; overflow-x: auto; }
    </style>
</head>
<body>
    <h1>Ansible Execution Report</h1>
    <div class="section">
        <h2>Execution Summary</h2>
        <p><strong>Date:</strong> $(date)</p>
        <p><strong>Status:</strong> 
            <span class="$([ $ANSIBLE_STATUS -eq 0 ] && echo 'success' || echo 'failure')">
                $([ $ANSIBLE_STATUS -eq 0 ] && echo 'SUCCESS' || echo 'FAILURE')
            </span>
        </p>
        <p><strong>Log File:</strong> ${LOG_FILE}</p>
    </div>
    <div class="section">
        <h2>Server Information</h2>
        <pre>$(grep -A 10 "\[servers\]" inventory.ini)</pre>
    </div>
    <div class="section">
        <h2>Execution Log</h2>
        <pre>$(cat "${LOG_FILE}")</pre>
    </div>
</body>
</html>
EOF

echo "Execution completed with status: $ANSIBLE_STATUS"
echo "Log saved to: ${LOG_FILE}"
echo "Report saved to: ${REPORT_FILE}"

# Open the report in the default browser if on a desktop environment
if [ -n "$DISPLAY" ] && command -v xdg-open > /dev/null; then
    xdg-open "${REPORT_FILE}"
fi

exit $ANSIBLE_STATUS
