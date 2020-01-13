import subprocess
import argparse

parser = argparse.ArgumentParser(description='Download Q1 2020 D&A Level Up Competition Data')
parser.add_argument('input1', type=str, help="Enter 'preview' for preview of data or 'full' to download all of the data")

args = parser.parse_args()

def main():
    if args.input1 == 'preview':
        print('Downloading preview of data...')
        subprocess.run(['gsutil', 'cp', 'gs://slalom-level-up-q1-2020/data/citibike_stations.csv', '.'])

    if args.input1 == 'full':
        print('Downloading full data...')
        subprocess.run(['gsutil', 'cp', 'gs://slalom-level-up-q1-2020/data/citibike_stations.csv', '.'])
        for i in range(0,19):
            if i < 10:
                subprocess.run(['gsutil', 'cp', f'gs://slalom-level-up-q1-2020/data/citibike_trips_00000000000{i}.csv', '.'])
            else:
                subprocess.run(['gsutil', 'cp', f'gs://slalom-level-up-q1-2020/data/citibike_trips_0000000000{i}.csv', '.'])

if __name__ == '__main__':
    main()
