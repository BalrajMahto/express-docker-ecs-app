# ----------------------
# Stage 1: Builder
# ----------------------
FROM node:18 AS builder
WORKDIR /build

# Copy package.json and package-lock.json first (better for caching)
COPY package*.json ./

# Install all dependencies (including dev for build)
RUN npm install

# Copy the source and tsconfig
COPY tsconfig.json ./
COPY src ./src

# Build TypeScript -> dist
RUN npm run build

# ----------------------
# Stage 2: Runner
# ----------------------
FROM node:18 AS runner
WORKDIR /app

# Copy only production dependencies
COPY package*.json ./
RUN npm install --only=production

# Copy built JS from builder stage
COPY --from=builder /build/dist ./dist

# Expose port
EXPOSE 8000
 
# Start the server
CMD ["npm", "start"]
