---
tags:
  - mozart
---
## Deploying custom Firmware

### Developer builds

Usually, when you make a change in workspace that is needed for a local Mozart build to work you do the following:

1. Make a developer (prod or sdk) or other build and get a version number `2000.X.Y.Z`
2. Copy these values in `mozart.yaml` (for a `imx8-prod` build) or in the `mozart.json` for the **SDK** build
3. When building Mozart
    1. the system will fetch the image from mozart.yaml and deploy it to the target
    2. the system will fetch the sdk and use it to build the Mozart application
    3. and deploy the application to the target
4. When building from workspace, we don't really care about this file

Once they the appropriate files are updated, build and deploy the image.