# Stage 1: Builder - This stage builds the Next.js application
FROM node:20-alpine AS builder
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application source code
COPY . .

# Build the application
RUN npm run build

# ---

# Stage 2: Runner - This is the final, small, production-ready image
FROM node:20-alpine AS runner
WORKDIR /app

# Set environment to production
ENV NODE_ENV=production

# Copy only the necessary files from the 'builder' stage
COPY --from=builder /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static

# Expose the port the application runs on
EXPOSE 3000

# The command to start the application
CMD ["node", "server.js"]
