FROM frappe/erpnext:v15.0.0

USER frappe

# Install Custom UI App for NAV-style layout
RUN bench get-app https://github.com/janakvaghela542/Frappe-Custom-UI-App.git || true

EXPOSE 8000
