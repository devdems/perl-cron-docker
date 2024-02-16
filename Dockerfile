FROM alpine:latest

# Install Perl and necessary build tools
RUN apk add --no-cache perl perl-utils perl-dev build-base

# Set the working directory
WORKDIR /app

# Install necessary Perl modules using CPAN
RUN cpan LWP::UserAgent && \
    cpan LWP::Protocol::https && \
    cpan JSON && \
    cpan DBI && \
    cpan DBD::mysql && \
    cpan IO::Socket::SSL && \
    cpan Net::SSLeay

# Specify the command to run on container startup
CMD [ "perl", "./run_script.pl" ]
