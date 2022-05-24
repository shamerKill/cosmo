if [ ! -d "./v1beta1" ]
	then mkdir ./v1beta1
fi
protoc \
	--proto_path=./ \
	--dart_out=./v1beta1 \
	./signer.proto