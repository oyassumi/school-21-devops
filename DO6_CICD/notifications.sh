#!/bin/bash

TIME=30
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

if [ "$1" = "success" ]; then
    STATUS="SUCCESS"
else
    STATUS="FAILED"
fi

TEXT="CI: SUCCESS%0ACD: $STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl --proxy "$PROXY" -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null