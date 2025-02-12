# Azure Function in .NET 8 In-Process

This project contains an example of an Azure Function written in C# with .NET 8 in-process.
to better understand differences between isolated and in proc model you can referr to [this microsoft article](https://learn.microsoft.com/en-us/azure/azure-functions/dotnet-isolated-in-process-differences)

## Get started

### Dev Container quick start
0. docker have to be installed and running
1. clone repo
2. navogate to `/devcontainer-template/net-8/azure-function/`
3. open in vscode with `code .`
4. open vscode commands (`ctrl` + `shift` + `p`)
5. select `>Dev Containers: Rebuild and Reopen in Container`
6. wait for image building (only first time) and vscode windows reload inside container

happy coding

### Dev Container Configuration notes

This project uses a Dev Container to simplify development. 

The Dev Container configuration is located in `.devcontainer/`.

As you can see, proposed dev container uses a semi-custom docker image based on debian 12 with Function Core Tools installed.

The `devcontainer.json` file specifies the Dev Container settings, including workspace mounts and necessary Visual Studio Code extensions.


### Azure Function Project Structure

- `src/example/`: Contains the function's source code.
- `src/example/triggers/HttpTrigger1.cs`: Implementation of the HTTP trigger function.
- `src/example/host.json`: Host configuration.
- `src/example/local.settings.json`: Local settings configuration.



### Azure Function Local Settings Configuration

The `local.settings.json` file contains the local settings for running the function. Here is an explanation of the parameters:

- `FUNCTIONS_WORKER_RUNTIME`: Specifies the function runtime, in this case `dotnet`.
- `AzureWebJobsStorage`: Uses local development storage (Azurite).
- `FUNCTIONS_INPROC_NET8_ENABLED`: Enables support for .NET 8 in-process.
- `FUNCTIONS_EXTENSION_VERSION`: Version of the functions extension, in this case `~4`.

Example of `local.settings.json`:
```json
{
  "IsEncrypted": false,
  "Values": {
    "FUNCTIONS_WORKER_RUNTIME": "dotnet",
    "AzureWebJobsStorage": "UseDevelopmentStorage=true",
    "FUNCTIONS_INPROC_NET8_ENABLED": "1",
    "FUNCTIONS_EXTENSION_VERSION": "~4"
  }
}
```

## Common Issues

Sometimes the Docker image may have permission issues with the .NET 8 in-process core tools. To resolve this issue, run the following command:

```sh
sudo chmod +x /usr/lib/azure-functions-core-tools-4/in-proc8/func
```
## Notes & appendix

### Running the Function

To run the function locally, use the command:

```sh
func start
```
This will start the functions host and the function will be available at `http://localhost:7071`.

### Debugging

To debug the function, you can use the F5 key in Visual Studio Code. This will start the function in debug mode, allowing you to set breakpoints and step through the code.

### VS Code Configuration
preferred way is to use vscode command to inizialize folder, alternatively this is my config under `.vscode` folder

`settings.json`:

```json
{
    "azureFunctions.deploySubpath": "src/example/bin/Release/net8.0/publish",
    "azureFunctions.projectLanguage": "C#",
    "azureFunctions.projectRuntime": "~4",
    "debug.internalConsoleOptions": "neverOpen",
    "azureFunctions.projectSubpath": "src/example",
    "azureFunctions.preDeployTask": "publish (functions)"
}
```

`extensions.json`:

```json
{
  "recommendations": [
    "ms-azuretools.vscode-azurefunctions",
    "ms-dotnettools.csharp"
  ]
}
```

`tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "clean (functions)",
      "command": "dotnet",
      "args": [
        "clean",
        "/property:GenerateFullPaths=true",
        "/consoleloggerparameters:NoSummary"
      ],
      "type": "process",
      "problemMatcher": "$msCompile",
      "options": {
        "cwd": "${workspaceFolder}/src/example"
      }
    },
    {
      "label": "build (functions)",
      "command": "dotnet",
      "args": [
        "build",
        "/property:GenerateFullPaths=true",
        "/consoleloggerparameters:NoSummary"
      ],
      "type": "process",
      "dependsOn": "clean (functions)",
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "problemMatcher": "$msCompile",
      "options": {
        "cwd": "${workspaceFolder}/src/example"
      }
    },
    {
      "type": "func",
      "dependsOn": "build (functions)",
      "options": {
        "cwd": "${workspaceFolder}/src/example/bin/Debug/net8.0"
      },
      "command": "host start",
      "isBackground": true,
      "problemMatcher": "$func-dotnet-watch"
    }
  ]
}
```

`launch.json`:

```json
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Attach to .NET Functions",
      "type": "coreclr",
      "request": "attach",
      "processId": "${command:azureFunctions.pickProcess}"
    }
  ]
}
```

## Contributions & License

If you would like to contribute to this project, feel free to open a pull request or report an issue.

## License

This project is released under the MIT License.