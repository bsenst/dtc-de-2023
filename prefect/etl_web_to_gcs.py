from prefect import flow, task

@task
def extract():
    pass

@task
def transform():
    pass

@task
def load():
    pass

@flow
def flow_taxi():
    extract()
    transform()
    load()

flow_taxi()