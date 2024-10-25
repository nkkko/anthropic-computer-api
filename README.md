# Anthropic Computer Use API Demo

This project demonstrates the use of Anthropic's Computer Use API, allowing an AI agent to interact with a virtual computer environment. Slight mix and match of [Anthropic Quickstart Demo](https://github.com/anthropics/anthropic-quickstarts) to get it running in Daytona.

## Project Structure

- `computer_use_demo/`: Main package containing the demo application
  - `tools/`: Custom tools for interacting with the virtual environment
  - `streamlit.py`: Streamlit-based user interface
  - `loop.py`: Main loop for AI agent interaction
- `tests/`: Unit tests for the project
- `image/`: Scripts and configurations for setting up the virtual environment
- `manage_xvfb.sh`: Script to manage Xvfb (X Virtual Framebuffer)
- `setup.sh`: Setup script for the project
- `requirements.txt`: Python dependencies

## Setup

1. Ensure you have Python 3.12 or lower installed.
2. Install Rust and Cargo (required for some dependencies).
3. Run the setup script:

```bash
./setup.sh
```

This will create a virtual environment, install dependencies, and set up pre-commit hooks.

## Running the Demo

1. Set up the virtual display:

```bash
./setup_virtual_display.sh
```

2. Start the Streamlit application:

```bash
python -m streamlit run computer_use_demo/streamlit.py
```

3. Open a web browser and navigate to the provided URL (typically http://localhost:8501).

## Features

- Virtual computer environment with Xvfb, x11vnc, and noVNC
- Streamlit-based user interface for interacting with the AI agent
- Custom tools for file editing, bash commands, and computer interaction
- Support for multiple API providers (Anthropic, Bedrock, Vertex)

## Testing

Run the tests using pytest:

```bash
pytest
```

## Docker Support

A Dockerfile and related scripts are provided for containerized deployment.

## Note

This demo is designed to run in a controlled environment. Never provide access to sensitive accounts or data, as malicious web content can potentially hijack the AI's behavior.
