# Install hyperledge and fabric-samples
# curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.0.1 1.4.6 0.4.18

# This will create a directory called fabric-samples under your current directory# copy p1 into fabric-samples/
cp -r ../CSE598project1_spring21 ./p1

# in p1 directory
cd p1 && npm install

# in fabric-samples/test-network 
cd ../test-network

# Start Test Network
./network.sh up -s couchdb
# Create Channal choose one of the following
./network.sh createChannel

export PATH=${PWD}/../bin:${PWD}:$PATH
export FABRIC_CFG_PATH=$PWD/../config/
export CORE_PEER_TLS_ENABLED=true

# Org 1
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051

# Package:
peer lifecycle chaincode package p1.tar.gz --path ../p1 --lang node --label p1

# Install
peer lifecycle chaincode install p1.tar.gz

# Verify Installed
peer lifecycle chaincode queryinstalled
