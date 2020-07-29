import numpy as np
import simps_2d as s2d
import time


def S_simps(N):

    """
    S_ij for Simpson's 2d integration

    """
    S0 = [1, 1]

    for i in range(1, (N-2) + 1):

        if i % 2 == 0:

            S0.insert(i, 2)

        else:

            S0.insert(i, 4)

    S0 = np.array(S0)

    S = np.zeros((N, N))

    for i in range(N):

        S[i, :] = S0

    for i in range(1, N-1):

        if i % 2 == 1:

            S[i, :] = 4 * S[i, :]

        else:

            S[i, :] = 2 * S[i, :]

    return S


def simps_2d_py(fxy, x, y):

    """
    Simpson's rule for 2d integral using Python
    """

    I_simps = 0.0

    N = x.size

    h_x = (x.max() - x.min())/(N - 1)
    h_y = (y.max() - y.min())/(N - 1)

    S = S_simps(N)

    for i in range(x.size):

        for j in range(y.size):

            I_simps += 1.0/9 * h_x * h_y * S[i, j] * fxy[i, j]

    return I_simps


