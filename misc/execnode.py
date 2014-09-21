
import os
import pymongo
import sys

from analytics import exec_node

def check_database(uri):
    """
    Checks if database for a user exists, if not creates it.
    """
    client = pymongo.MongoClient(uri)

    # if user doesn't exist create new DB!
    if 'foo' not in client.database_names():
        db = client['foo']
        db.add_user('foo', 'bar', roles=['readWrite'])
    client.disconnect()

if __name__ == '__main__':
    if len(sys.argv) < 2:
        raise AttributeError('please provide a tenant id for this execution '
                             'node as first argument!')

    user = sys.argv[1]
    mongo = os.environ['MONGO_URI']
    broker = os.environ['RABBITMQ_URI']
    check_database(mongo)
    exec_node.ExecNode(mongo, broker, user)
