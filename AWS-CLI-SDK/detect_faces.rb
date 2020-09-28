#Copyright 2018 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#PDX-License-Identifier: MIT-0 (For details, see https://github.com/awsdocs/amazon-rekognition-developer-guide/blob/master/LICENSE-SAMPLECODE.)

   # Add to your Gemfile
   # gem 'aws-sdk-rekognition'
   require 'aws-sdk-rekognition'
   credentials = Aws::Credentials.new(
      ENV['AWS_ACCESS_KEY_ID'],
      ENV['AWS_SECRET_ACCESS_KEY']
   )
   bucket = 'exampro-000' # the bucketname without s3://
   photo  = 'enterprise-d/data.jpg'# the name of file
   client   = Aws::Rekognition::Client.new credentials: credentials
   attrs = {
     image: {
       s3_object: {
         bucket: bucket,
         name: photo
       },
     },
     attributes: ['ALL']
   }
   response = client.detect_faces attrs
   puts "Detected faces for: #{photo}"
   response.face_details.each do |face_detail|
     low  = face_detail.age_range.low
     high = face_detail.age_range.high
     puts "The detected face is between: #{low} and #{high} years old"
     puts "All other attributes:"
     puts "  bounding_box.width:     #{face_detail.bounding_box.width}"
     puts "  bounding_box.height:    #{face_detail.bounding_box.height}"
     puts "  bounding_box.left:      #{face_detail.bounding_box.left}"
     puts "  bounding_box.top:       #{face_detail.bounding_box.top}"
     puts "  age.range.low:          #{face_detail.age_range.low}"
     puts "  age.range.high:         #{face_detail.age_range.high}"
     puts "  smile.value:            #{face_detail.smile.value}"
     puts "  smile.confidence:       #{face_detail.smile.confidence}"
     puts "  eyeglasses.value:       #{face_detail.eyeglasses.value}"
     puts "  eyeglasses.confidence:  #{face_detail.eyeglasses.confidence}"
     puts "  sunglasses.value:       #{face_detail.sunglasses.value}"
     puts "  sunglasses.confidence:  #{face_detail.sunglasses.confidence}"
     puts "  gender.value:           #{face_detail.gender.value}"
     puts "  gender.confidence:      #{face_detail.gender.confidence}"
     puts "  beard.value:            #{face_detail.beard.value}"
     puts "  beard.confidence:       #{face_detail.beard.confidence}"
     puts "  mustache.value:         #{face_detail.mustache.value}"
     puts "  mustache.confidence:    #{face_detail.mustache.confidence}"
     puts "  eyes_open.value:        #{face_detail.eyes_open.value}"
     puts "  eyes_open.confidence:   #{face_detail.eyes_open.confidence}"
     puts "  mout_open.value:        #{face_detail.mouth_open.value}"
     puts "  mout_open.confidence:   #{face_detail.mouth_open.confidence}"
     puts "  emotions[0].type:       #{face_detail.emotions[0].type}"
     puts "  emotions[0].confidence: #{face_detail.emotions[0].confidence}"
     puts "  landmarks[0].type:      #{face_detail.landmarks[0].type}"
     puts "  landmarks[0].x:         #{face_detail.landmarks[0].x}"
     puts "  landmarks[0].y:         #{face_detail.landmarks[0].y}"
     puts "  pose.roll:              #{face_detail.pose.roll}"
     puts "  pose.yaw:               #{face_detail.pose.yaw}"
     puts "  pose.pitch:             #{face_detail.pose.pitch}"
     puts "  quality.brightness:     #{face_detail.quality.brightness}"
     puts "  quality.sharpness:      #{face_detail.quality.sharpness}"
     puts "  confidence:             #{face_detail.confidence}"
     puts "------------"
     puts ""
   end