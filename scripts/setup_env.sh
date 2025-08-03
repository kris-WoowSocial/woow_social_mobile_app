#!/bin/bash

# Create environment configuration
echo "Setting up environment configuration..."

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
  cat > .env <<EOL
# API Keys and Secrets
GOOGLE_API_KEY=your_google_api_key_here
# Add other environment variables below

# Note: Add .env to your .gitignore
EOL
  echo "Created .env file. Please add your API keys and secrets."
else
  echo ".env file already exists."
fi

# Make the script executable
chmod +x setup_env.sh

echo "Setup complete. Don't forget to add .env to your .gitignore!"
