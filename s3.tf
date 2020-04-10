provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket" "examplebucket" {
  bucket = "examplebuckettftestapril42020767676767"
  acl    = "private"
  region = "us-east-2"

  versioning {
    enabled = true
  }

}

resource "aws_s3_bucket_object" "myfirstobject" {
  bucket = "${aws_s3_bucket.examplebucket.id}"
  key = "testfile.txt"
  source = "./sampleobject.txt"
  etag = "${md5(file("./sampleobject.txt"))}}"
}

