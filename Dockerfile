# syntax=docker/dockerfile:1
# specifies the required Dockerfile syntax version

# starts by using the official Node.js Docker image tagged with version 18-alpine as the base image for this build
FROM node:18-alpine

# Set the working directory inside the container to /app
WORKDIR /app

# Copy the current directory's contents into the /app directory of the container
# Copies the content from the current directory (where the Dockerfile resides) into the /app directory within the Docker container. This includes your application files.
COPY . .

# Install production dependencies using Yarn
# installs the Node.js dependencies listed in the package.json file. 
# --production flag means it only installs production dependencies, omitting development-specific ones
RUN yarn install --production

# Set the default command to run the application when the container starts
# uses Node.js to execute the src/index.js file within the container
# assumes the application's entry point is index.js inside a 'src' directory
CMD ["node", "src/index.js"]

# Expose port 3000 to the outside world (documentation purpose, actual port exposure needs to be done when running the container)
# Informs Docker that the container will listen on port 3000 at runtime.
EXPOSE 3000