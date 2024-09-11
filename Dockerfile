FROM confluentinc/cp-kafka-connect

COPY connectors.csv ./

RUN while IFS="," read -r vendor connector version; \
do \
  confluent-hub connect plugin install ${vendor}/${connector}:${version}; \
done < connectors.csv;