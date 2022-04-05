FROM mcr.microsoft.com/mssql-tools
USER root
COPY restoreDatabase.sh /restoreDatabase.sh
COPY ./scripts/ /scripts
CMD "./restoreDatabase.sh"
