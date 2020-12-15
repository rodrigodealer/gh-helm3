#!/bin/sh -l

output=`helm $1`
echo "::set-output name=result::$output"
