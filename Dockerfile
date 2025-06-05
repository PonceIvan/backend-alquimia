# Etapa 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copiar todo el contenido del repo
COPY . .

# Restaurar dependencias desde la ruta correcta
RUN dotnet restore ./alquimia.api/alquimia.Api.csproj

# Publicar la app
RUN dotnet publish ./alquimia.api/alquimia.Api.csproj -c Release -o /publish

# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

COPY --from=build /publish .

ENTRYPOINT ["dotnet", "alquimia.Api.dll"]
