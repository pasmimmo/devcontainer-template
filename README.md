# DevContainer Template

This repository provides a collection of DevContainer examples.  The goal is to offer ready-to-use development environments and sample projects for various programming languages.

# What are dev containers?

Dev containers (or development containers) are pre-configured, standardized development environments that run inside a Docker container.  A dev container provides a complete and isolated development environment, including everything needed to develop an application: the operating system, libraries, development tools, and more.

# How are dev containers used?

To use a dev container, you'll need a local development environment with Docker installed. Once Docker is installed, a configuration file (usually named `devcontainer.json`) defines the desired development environment. This file specifies the Docker image to use, the ports to expose, the volumes to mount, and other settings.

After creating the configuration file, you can start the dev container using a command-line tool (e.g., `docker-compose up`) or, more conveniently, directly from your IDE (like VS Code or IntelliJ). The IDE integration simplifies the process of creating, starting, and connecting to the container. The container will then be created and started, making the development environment ready for use.

## Advantages of dev containers

Dev containers offer several advantages:

- **Standardization:** Dev containers create standardized development environments usable by all team members. This ensures everyone works with the same configuration, eliminating compatibility and setup issues.
- **Isolation:** Dev containers are isolated from the local operating system. Changes to the development environment won't affect the local system, which is crucial for projects with complex or conflicting dependencies.
- **Portability:** Dev containers are easily moved between computers, allowing you to work on the same project from anywhere.
- **Reproducibility:** Dev containers are reproducible, meaning you can recreate the development environment at any time. This is invaluable for long-term projects or when sharing the environment with others.

## Disadvantages of dev containers

Dev containers also have some drawbacks:

- **Complexity:** Configuring a dev container can be complex, especially for projects with intricate dependencies (hence the purpose of this repository).
- **Overhead:** Running a dev container can introduce some performance overhead, particularly on machines with limited resources. While minimal on modern hardware, some overhead is unavoidable.
- **Learning Curve:**  Using dev containers requires a learning curve, especially for those unfamiliar with Docker.

## Available Examples

### Java 17 with Spring Boot 3

This example features a Spring Boot 3 application using Java 17. It demonstrates a simple REST controller and includes a Dockerfile for building a distroless Docker image.

### .NET 8 with Azure Functions

This example showcases an Azure Functions project using .NET 8. It demonstrates an HTTP trigger function and provides a Dockerfile for setting up the development environment.

## Getting Started

1. Clone the repository.
2. Open the desired example folder in Visual Studio Code (recommended for the best experience).
3. Follow the instructions in the respective `README.md` files within each example folder to set up and run the projects.

## Contributing

Contributions are welcome! Feel free to add more examples or improve existing ones.  Submit your pull requests to contribute.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
