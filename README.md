# Texture-Segmentation-using-Gabor-Filters
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

### Choice of Filter Parameters

We use orientation separation angles of 30◦ as recommended in [4], that is:

