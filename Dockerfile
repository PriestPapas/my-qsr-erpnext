FROM frappe/erpnext:v15.0.0

USER frappe
WORKDIR /home/frappe/frappe-bench

# Expose web server port
EXPOSE 8000
