FROM node:4
WORKDIR /app
COPY package.json /app/
# RUN npm install
RUN yarn install --ignore-engines
COPY . .
EXPOSE 5000
# If start script present in package.json
CMD ["npm", "start"]

# If No start script present in package.json   
# CMD ["node", "index.js"]

# ----- Make it flexible for both npm and yarn ----
# FROM node:18
# WORKDIR /app
# COPY package.json yarn.lock* ./
# # Prefer yarn if lockfile exists, fallback to npm
# RUN if [ -f yarn.lock ]; then yarn install; else npm install; fi
# COPY . .
# EXPOSE 5000
# CMD ["node", "index.js"]
