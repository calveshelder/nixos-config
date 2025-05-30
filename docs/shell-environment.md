# Custom Shell Environment Configuration (shell.nix)

This file defines a custom Nix shell environment tailored for Python development with AWS Elastic Beanstalk.

## Key Features

### 1. Development Environment Setup
- **Python Stack**: Includes Python, pip, virtualenv, setuptools, and wheel
- **AWS CLI Tools**: Pre-installed EB CLI (awsebcli) for Elastic Beanstalk
- **Shell Customization**: Automatic virtual environment management

### 2. Shell Features

#### Virtual Environment Management:
- Automatically creates a `.venv` directory if it doesn't exist
- Activates the virtual environment upon shell startup
- Makes virtualenv's bin directory local to your project first in PATH

#### AWS CLI Integration:
- Installs and configures EB CLI tools for AWS Elastic Beanstalk deployments

### 3. Included Tools
- **Git**: For version control
- **OpenSSL**: For secure cryptographic operations
- **Python Packaging Tools**: pip, virtualenv, setuptools, wheel

## Usage Instructions

1. Clone your project repository to your local machine
2. Navigate to the project directory containing this shell.nix file
3. Activate the shell with:
   ```bash
   nix shell --pure
   ```
4. Use the environment by running your usual commands
5. Deactivate with:
   ```bash
   exit
   ```

## Configuration Details

The shell configuration is contained in `shell.nix` and includes:

- **Environment Setup**: Uses Nix's `mkShell` function to create a clean shell environment
- **Dependency Management**: Handles both Python and system-level dependencies
- **Shell Hooks**: Custom hooks for virtualenv creation, activation, and CLI tool installation

The configuration ensures:
- Clean isolation of development environments
- Consistent dependency versions across different systems
- Easy AWS CLI access for cloud deployments
