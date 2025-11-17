# --- Base Image ---
FROM n8nio/n8n:latest

# --- Copy entrypoint as root ---
USER root
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# --- Switch to node user ---
USER node
WORKDIR /home/node/

ENV N8N_USER_FOLDER=/home/node/.n8n

EXPOSE 5678

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["n8n"]
