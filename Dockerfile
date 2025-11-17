# --- Base Image ---
FROM n8nio/n8n:latest

# --- Copy entrypoint for permission fix ---
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# --- Use non-root user for security ---
USER node

# --- Set working directory ---
WORKDIR /home/node/

# --- Persist n8n data directory (Render automatically creates persistent disk) ---
ENV N8N_USER_FOLDER=/home/node/.n8n

# --- Expose n8n port ---
EXPOSE 5678

# --- Entrypoint & command ---
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["n8n"]
