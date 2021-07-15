# Motivation

This is a proof of concept setup that can monitors a website.

Infrastructure consists of:

1. prometheus-blackbox-exporter: Sends requests to https://www.sadibey.com and https://www.google.com
1. prometheus: Polls blackbox-exporter for metrics
1. grafana: Fancy dashboard generator that is configured to connect to the prometheus instance.

# How to use

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop)
1. `docker compose up`
1. Visit [Grafana](http://localhost:3000/explore?orgId=1&left=%5B%22now-5m%22,%22now%22,%22Prometheus%22,%7B%22exemplar%22:true,%22expr%22:%22probe_duration_seconds%22,%22hide%22:false%7D%5D) and login with `admin:grafana`. This should render you the `probe_duration_seconds`.


# Testing

There is a basic test that is running once every day that ensures:
1. `prometheus` datasource is properly imported into `grafana`
1. `prometheus` properly asked `blackbox-exporter` to scrape https://www.sadibey.com/

Please don't hesitate to create an issue if you see this failing so that I can fix it quicker.

Latest status:

[![Test](https://github.com/canburak/prometheus-poc/actions/workflows/test.yml/badge.svg)](https://github.com/canburak/prometheus-poc/actions/workflows/test.yml)
