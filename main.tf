resource "aws_key_pair" "clavessh" {
  key_name   = "grupo7sshkey"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDUUX30RSchE34DT3BDOt/P1mQU9WVsk4pylL0FSIA1yi9c53jLIFpkmTOZbDUrf8bXmfbzz3PR6RY/Q+Sx4HjOfWTHqc2kXYvgls6/PVcFQ0+GHo37niOjItRRt6f6aQcx7WF7SEQpGTAmPlltr+J54IOHiIHmUpJTVZ2UOAoRMeHtE5xxgf6jZJaSoOyV7MXFcdhzSURLrpDBMPbcHjefvpCFarDqk/1iPV4iaJjvv4XBW1dYg1wJPFdatEAaqXUiGdH1xEMJrcuVNowVYQcDagPfrwVVp3vp2Io/GUDtZc7x70CIfi72NVTL0frVe29wTJ+eIEMPZH7M5Ffl/ybkUhecoKndEoLOCXiRI/Ahz6uLrdza82MOaGU95MULV10rkLLocvMF+VBCmpALddLPrSru3Meu5FvotNLO8GbEaXoH3OQTtBANlxWylzPnqqeVPnhYJh0hEB8ktNivbRinQipruT7/Jpd7XqqkcLiVk/y4CiIUcHVt4GckVivH/RM= bruno@BRUNO-NB"
}

resource "aws_instance" "webserver" {
  ami                         = "ami-023c11a32b0207432"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.clavessh.key_name}"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.sg.id]
  subnet_id                   = aws_subnet.subnet.id
  user_data                   = "${file("create_apache.sh")}"

  tags = {
    Name = "webserver"
  }
}
