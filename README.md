# Texture Segmentation using Gabor Filters
The texture segmentation algorithm in this project involves the following three steps:

• Decomposition of the input image using a filter bank,

• Feature extraction,

• Clustering.


### 1- Filter Bank

We present the channels with a bank of two-dimensional Gabor filters. A two-dimensional Gabor function
consists of a sinusoidal plane wave of some frequency and orientation, modulated by a two-dimensional
Gaussian [3]. The Gabor filter in the spatial domain is given by

![equation1](https://user-images.githubusercontent.com/15813546/31584944-6b9ce89a-b1c5-11e7-872a-a4eb1870a624.jpg)

In this equation, λ represents the wavelength of the cosine factor, θ represents the orientation of the
normal to the parallel stripes of a Gabor function in degrees, ψ is the phase offset in degrees, and γ is the
spatial aspect ratio and specifies the elliptically of the support of the Gabor function, and σ is the standard
deviation of the Gaussian determines the (linear) size of the receptive field.

The parameter λ is the wavelength and f = 1/λ is the spatial frequency of the cosine factor. The ratio σ/λ
determines the spatial frequency bandwidth of simple cells and thus the number of parallel excitatory and
inhibitory stripe zones which can be observed in their receptive fields. The half-response spatial frequency
bandwidth b (in octaves) and the ratio σ/λ are related as follows:

![equation2](https://user-images.githubusercontent.com/15813546/31584961-dc646026-b1c5-11e7-89bf-5b1bb14b82c0.jpg)

ψ = 0◦ and ψ = 90◦ returns the real part and the imaginary part of Gabor filter respectively. The real part
of Gabor filter is an even-symmetric filter, and the property satisfies the requirement proposed by Malik [1].
Therefore, we use the real part of Gabor.

#### Choice of Filter Parameters

We use orientation separation angles of 30◦ as recommended in [4], that is:

![equation3](https://user-images.githubusercontent.com/15813546/31584981-3d7e1e38-b1c6-11e7-9ab6-6e0693d38e78.jpg)

and following values of frequencies as recommended in [6]
![equation4](https://user-images.githubusercontent.com/15813546/31584990-652c251a-b1c6-11e7-9026-3e729f550684.jpg)

where ![equation5](https://user-images.githubusercontent.com/15813546/31585017-c9891d9c-b1c6-11e7-8b4d-4125f0c151cc.jpg), Nc is the width of image which is a power of 2. Note that ![equation6](https://user-images.githubusercontent.com/15813546/31585024-e950a26c-b1c6-11e7-8066-9ca836cfc5ba.jpg)
and ![equation7](https://user-images.githubusercontent.com/15813546/31585032-f6106a64-b1c6-11e7-855d-e1530a86f5c9.jpg).

### 2-  Feature Extraction

Jain [2] suggested to use a nonlinear sigmoidal function,

![equation8](https://user-images.githubusercontent.com/15813546/31585064-a9012906-b1c7-11e7-897f-d5f28a7b8687.jpg)

which saturates the output of the filters.
Jain [2] also suggested to compute the average absolute deviation (AAD) for each filtered image. We use
Gaussian smoothing function which is given by

![equation9](https://user-images.githubusercontent.com/15813546/31585066-af7b7ef8-b1c7-11e7-90ad-04bc40193c45.jpg)

where σ is the standard deviation which determines the (linear) size of the receptive field (window size).

   We choose ![eq10](https://user-images.githubusercontent.com/15813546/31585078-10912e18-b1c8-11e7-86b8-6f13d6346a6a.jpg) where ![eq11](https://user-images.githubusercontent.com/15813546/31585079-17ac21d0-b1c8-11e7-9b3e-7388ae60f260.jpg) is the scale parameter of Gabor filter given by (2) as similar to the recommendation, ![eq12](https://user-images.githubusercontent.com/15813546/31585080-259f1f36-b1c8-11e7-8fc6-531d911ef60a.jpg) , by [6].
   
   ### 3- Clustering
   
   The final step is to cluster the pixels into a number of clusters representing the texture regions. Although
Jain used CLUSTER algorithm [2], we use the k-means algorithm. The algorithm of k-means is as follows:

'   1. Initialize centroids of K-clusters randomly.'

'   2. Assign each sample to the nearest centroid.'

'   3. Calculate centroids (means) of K-clusters.'

'   4. If centroids are unchanged, done. Otherwise, go to step 2.'

Furthermore, we include the spatial coordinates of the pixels as two additional features to take into
account the spatial adjacency information in the clustering process as proposed by [2].

### 4- Results

The multi-channel image segmentation system mentioned above was implemented and tested against a textured
image from the Brodatz album [5]. The number of clusters is considered 5.

![Result Pic1](https://user-images.githubusercontent.com/15813546/31585142-7bc2b7fa-b1c9-11e7-9e7d-fa460f94ea1a.jpg)

Also, the result is shown in another image as follow.

![Result pic2](https://user-images.githubusercontent.com/15813546/31585140-72f6b9fa-b1c9-11e7-9272-2a399b6b40f1.jpg)



### Bibliography

[1] Perona and Malik, ”Preattentive texture discrimination with early vision mechanisms,” J. Opt. Soc.
Am. A, Vol. 7, No. 5, May 1990.

[2] A. K. Jain, F. Farrokhnia, ”Unsupervised texture segmentation using Gabor filters,” Pattern Recogni-
tion, vol. 24, no. 12, pp.1167-1186, 1991.

[3] J.G. Daugman: ”Uncertainty relations for resolution in space, spatial frequency, and orientation opti-
mized by two-dimensional visual cortical filters”, Journal of the Optical Society of America A, 1985,
vol. 2, pp. 1160-1169.

[4] D. Clausi, M. Ed Jernigan, ”Designing Gabor filters for optimal texture separability,” Pattern Recogni-
tion, vol. 33, pp. 1835-1849, 2000.

[5] P. Drodatz, ”Textures: A Photographic Album for Artists and Designers,” ”’Dover”’, New York, 1966.

[6] Jianguo Zhang, Tieniu Tan, Li Ma, ”Invariant texture segmentation via circular gabor filter”, Proceedings of the 16th IAPR International Conference on Pattern Recognition (ICPR), Vol II, pp. 901-904,2002.







