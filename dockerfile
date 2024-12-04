# Step 1: Use a lightweight Python base image
FROM python:3.12-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy requirements file and install dependencies
COPY requirements.txt .
RUN python -m venv /opt/venv && \
    /opt/venv/bin/pip install -r requirements.txt
# Step 4: Copy the application code
COPY . .

# Step 5: Expose the application port and specify the CMD
EXPOSE 5000
CMD ["/opt/venv/bin/gunicorn", "-b", "0.0.0.0:5000", "back:create_app()"]
