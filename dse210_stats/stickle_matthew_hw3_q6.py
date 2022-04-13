from pathlib import Path

import numpy as np
import matplotlib.pyplot as plt

def main():
    mean = [0, 0]
    cov_a = [[9, 0], [0, 1]]
    cov_b = [[4, -1], [-1, 4]]
    samples = 100000

    # Get samples
    x_a, y_a = np.random.multivariate_normal(mean, cov_a, samples).T
    x_b, y_b = np.random.multivariate_normal(mean, cov_b, samples).T

    # Plot
    # part a
    plt.subplot(2, 1, 1)
    plt.plot(x_a, y_a, 'x')
    plt.axis('equal')
    plt.title('6a')
    # part b
    plt.subplot(2, 1, 2)
    plt.plot(x_b, y_b, 'x')
    plt.axis('equal')
    plt.title('6b')
    plt.tight_layout()

    # save figure
    f_path = Path(f'./q6.png')
    plt.savefig(f_path, bbox_inches='tight')

if __name__ == '__main__':
    main()