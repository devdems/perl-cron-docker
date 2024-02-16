FROM alpine:latest

# Install Perl and necessary build tools
RUN apk upgrade && \
    apk add --no-cache perl perl-utils perl-dev make gcc build-base openssl-dev && \
    rm -rf /var/cache/apk/* 

# Set the working directory
WORKDIR /app

# Install necessary Perl modules using CPAN
RUN cpan -i LWP && \
    cpan -i JSON && \
    cpan -i DBI && \
    cpan -i DBD && \
    cpan -i IO && \
    cpan -i Net

# Specify the command to run on container startup
CMD [ "perl", "./run_script.pl" ]
