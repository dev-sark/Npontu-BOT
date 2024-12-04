# Step 1: Use an official Python runtime as a base image
FROM python:3.12-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements.txt into the container
COPY requirements.txt .

# Step 4: Create and activate the virtual environment without relying on shell activation
RUN python -m venv /opt/venv --copies && \
    /opt/venv/bin/pip install --no-cache-dir -r requirements.txt
# Step 5: Add the virtual environment to PATH
ENV PATH="/opt/venv/bin:$PATH"

# Step 6: Copy the rest of the application files into the container
COPY . .

# Step 7: Ensure correct permissions for sensitive files
RUN chmod 644 /app/client_secret.json

# Step 8: Expose the port your app is running on
EXPOSE 5000

# Step 9: Set the default command to run the application
CMD ["gunicorn", "-b", "0.0.0.0:5000", "back:create_app()"]

