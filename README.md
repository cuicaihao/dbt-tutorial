# dbt-tutorial

Welcome to your new dbt project!

Source: [Quickstart for dbt Core from a manual install](https://docs.getdbt.com/guides/manual-install?step=6) 

## Using the starter project

Try running the following commands:

- dbt run
- dbt test

## Resources

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

## Scheduled serverless dbt + BigQuery service

Running shell commands from Cloud Run

```bash
#!/bin/sh
dbt run --profiles-dir .
```

Container image for dbt

Build the container using gcloud:

```bash
gcloud builds submit . --region us-central1 --tag gcr.io/$(gcloud config get-value project)/dbt-service
```

Deploy Cloud Run service

```bash
export SERVICE_NAME=dbt-service
export SERVICE_ACCOUNT=
gcloud run deploy ${SERVICE_NAME} \
    --image gcr.io/$(gcloud config get-value project)/${SERVICE_NAME} \
    --service-account ${SERVICE_ACCOUNT}@$(gcloud config get-value project).iam.gserviceaccount.com \
    --no-allow-unauthenticated
```