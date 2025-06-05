# Etapa 1: Build
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copiar todo el código
COPY . .

# Restaurar con el nombre correcto del .csproj
RUN dotnet restore ./Alquimia.API/alquimia.Api.csproj

# Publicar
RUN dotnet publish ./Alquimia.API/alquimia.Api.csproj -c Release -o /publish

# Etapa 2: Runtime
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app

COPY --from=build /publish .

ENTRYPOINT ["dotnet", "alquimia.Api.dll"]
