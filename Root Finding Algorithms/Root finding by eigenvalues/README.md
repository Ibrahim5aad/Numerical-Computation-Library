# *Finding the Roots of a Polynomial with Eigenvalues:*

 **Converting a Root Finding Problem to an Eigenvalue Problem**

Finding roots of polynomials is equivalent to finding eigenvalues. Not only can you find eigenvalues by solving for the roots of the characteristic polynomial, but you can conversely find roots of any polynomial by turning into a matrix and finding the eigenvalues.

#
The basic idea is to perform a [QR decomposition](https://en.wikipedia.org/wiki/QR_decomposition) on the companion matrix of the polynomial as a product of an [orthogonal matrix](https://en.wikipedia.org/wiki/Orthogonal_matrix) Q and an upper [triangular matrix](https://en.wikipedia.org/wiki/Triangular_matrix) R, multiply the factors in the reverse order R\*Q, and iterate. The resulting matrix will be converging to an upper triangular matrix, and its diagonal elements are converging to the roots of the polynomial.

![](RackMultipart20200725-4-1cx5vjk_html_e31db89fe7d6c977.png) ![](RackMultipart20200725-4-1cx5vjk_html_df22a9db1b811921.png) ![](RackMultipart20200725-4-1cx5vjk_html_5a3573c1a6eb670d.png)

Finding Roots with Eigenvalues by Ibrahim Mohamed Saad
