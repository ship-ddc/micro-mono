#!bin/bash

#execute a Test Plan on DiveCloud at Nouvola.com
curl -X POST -H 'Content-Type: application/json' -H 'x-api: {NOUVOLA_API_KEY}' https://divecloud.nouvola.com/api/v1/plans/{NOUVOLA_PLAN_ID}/run
