FROM python:3.7

RUN mkdir /home/tester
RUN groupadd -g 942 tester
RUN useradd -r -u 942 -g tester -d /home/tester tester
RUN chown tester:tester /home/tester
USER tester
WORKDIR /home/tester

CMD ["/bin/bash"]