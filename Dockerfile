# Etapa 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copiar todo el contenido del repo
COPY . .

# Ir a la carpeta del proyecto
WORKDIR /app/Alquimia.API

# Restaurar dependencias
RUN dotnet restore

# Publicar la app
RUN dotnet publish -c Release -o /publish

# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

COPY --from=build /publish .

ENTRYPOINT ["dotnet", "Alquimia.API.dll"]
