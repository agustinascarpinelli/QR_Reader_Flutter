# QR Reader App

Una aplicación Flutter que permite leer códigos QR y guardar las direcciones en una base de datos SQLite. La aplicación muestra las direcciones guardadas en una lista y ofrece la posibilidad de borrar el historial completo o eliminar direcciones individuales. Además, si se escanea un código QR válido de una ubicación, se abrirá en Google Maps.

## Características

- Escaneo de códigos QR con la cámara del dispositivo.
- Apertura de páginas web en el navegador del dispositivo.
- Guardado de direcciones en una base de datos SQLite.
- Visualización del historial de direcciones en una lista.
- Borrado de direcciones individuales o del historial completo.
- Visualización de ubicaciones en Google Maps.

## Dependencias

La aplicación utiliza las siguientes dependencias de Dart y paquetes de Flutter:

- [flutter_barcode_scanner](https://pub.dev/packages/flutter_barcode_scanner): para escanear códigos QR.
- [path_provider](https://pub.dev/packages/path_provider): para acceder al sistema de archivos y obtener la ubicación de almacenamiento de la base de datos SQLite.
- [sqflite](https://pub.dev/packages/sqflite): para interactuar con la base de datos SQLite y realizar operaciones CRUD.
- [url_launcher](https://pub.dev/packages/url_launcher): para abrir páginas web en el navegador del dispositivo.
- [google_maps_flutter](https://pub.dev/packages/google_maps_flutter): para mostrar ubicaciones en Google Maps.
- [provider](https://pub.dev/packages/provider): para la gestión del estado de la aplicación.

Asegúrate de revisar los enlaces proporcionados para obtener más información sobre cada una de las dependencias.

## Estructura del proyecto

El proyecto sigue una estructura de directorios común en Flutter:

- **lib**: contiene el código fuente de la aplicación.
  - **main.dart**: punto de entrada de la aplicación.
  - **models**: contiene el modelo de datos `ScanModel` y otros modelos relacionados.
  - **screens**: contiene las pantallas de la aplicación, como `HomeScreen`, `DirectionsScreen`, `MapScreen`, etc.
  - **providers**: contiene los proveedores de estado utilizados en la aplicación.
  - **services**: contiene los servicios de base de datos y otros servicios utilizados en la aplicación.
  - **widgets**: contiene los widgets reutilizables utilizados en la interfaz de usuario.

## Configuración

Para ejecutar la aplicación en tu entorno local, asegúrate de tener instalado Flutter y un emulador o dispositivo físico configurado. Luego, sigue estos pasos:

1. Clona este repositorio en tu máquina local.
2. Navega a la carpeta raíz del proyecto.
3. Ejecuta el siguiente comando para descargar las dependencias del proyecto:

   ```shell
   flutter pub get
   ```

4. Conecta un dispositivo o inicia un emulador.
5. Ejecuta el siguiente comando para iniciar la aplicación:

   ```shell
   flutter run
   ```

6. La aplicación se abrirá en el dispositivo/emulador y podrás comenzar a utilizarla.

## Contribución

Si deseas contribuir a este proyecto, sigue los siguientes pasos:

1. Realiza un fork de este repositorio.
2. Crea una nueva rama para tu contribución:

   ```shell
   git checkout -b
