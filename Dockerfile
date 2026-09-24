FROM frappe/erpnext:v15.0.0

USER frappe

# Install the custom NAV-style UI app into the image during build
RUN bench get-app https://github.com/janakvaghela542/Frappe-Custom-UI-App.git || true

# Copy an entrypoint script to run setup automatically on startup
COPY --chown=frappe:frappe entrypoint.sh /home/frappe/frappe-bench/entrypoint.sh
RUN chmod +x /home/frappe/frappe-bench/entrypoint.sh

EXPOSE 8000

ENTRYPOINT ["/home/frappe/frappe-bench/entrypoint.sh"]
