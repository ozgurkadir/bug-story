# Bug-Story

Bug-Story is a sample project management application developed by SAP Cloud Application Programming Model (CAP)

Contains these features of CAP :

- Authentication & Authorization (XSUAA and approuter )
- Custom actions (Includes confirmation popup and value help annotations )
- Fiori elements UI's (List Report - Object Page & Overview Page)
- Project "Piper" based simple Jenkins pipeline (Jenkins instance is required)
- Multitarget Application (MTA)



File / Folder | Purpose
---------|----------
`app/` | content for UI frontends go here
`db/` | domain models and data go here
`srv/` | service models and code go here
`package.json` | project metadata and configuration
`readme.md` | this getting started guide

## DEMO

![](demo/bug-story-demo.gif)

## Environment Prerequisites
- Node.js version 10 or 12
- @sap/cds-dk ( https://cap.cloud.sap/docs/get-started/ ) 
- Cloud MTA Build Tool (MBT) ( https://sap.github.io/cloud-mta-build-tool/download/ )
- Cloud Foundry CLI ( https://docs.cloudfoundry.org/cf-cli/install-go-cli.html )
- Cloud Foundry CLI MTA (aka MultiApps) plugin ( https://developers.sap.com/tutorials/cp-cf-install-cliplugin-mta.html )

## Next Steps...
```sh
- git clone https://github.com/ozgurkadir/bug-story.git
- cd bug-story
- Open a new terminal and run  `cds watch`
- ( in VSCode simply choose _**Terminal** > Run Task > cds watch_ )
- Start adding content, e.g. a [db/schema.cds](db/schema.cds), ...
```

## Deploy to Cloud Foundry Environment
Simply run these commands to deploy your own Cloud Foundry Environment
```sh
mbt build -t ./
cf deploy bug-story_1.0.0.mtar
```

## Learn more...

Learn more at https://cap.cloud.sap/docs/get-started/
