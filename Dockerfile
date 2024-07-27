# Use the official Python base image
FROM python:3.12-slim

# Set the working directory in the container
WORKDIR /app

# Install any needed packages specified in requirements.txt
COPY ./requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Jupyter Notebook config file
COPY ./jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the port Jupyter and debugpy use
EXPOSE 8888
EXPOSE 5678

# Run Jupyter Notebook
CMD ["jupyter", "notebook"]

