# Instructions to run the samples

## Server

- Just run the server normally, the server will deploy on port 9090 and the test endpoint is a POST against `/api/random`.

## App

- An iOS device must be used.
- Change the following file: `project_root/app/ios/Broadcast/ApiClient.swift`, alter line 7 with the URL of the deployed server.
- Ensure that you have the last version of Flutter installed to run the sample.
- Run the app with `flutter run`.
- Click on 'Start screencast'.
- Click on 'Start transmission' (or similar...depending on the language of the device).

## Expected result

- The server returns an status code 200.

## Actual result

- For some reason, the server returns an error (because the call.respond() throws an exception).