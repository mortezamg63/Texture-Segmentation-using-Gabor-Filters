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

#### Choice of Filter Parameters

We use orientation separation angles of 30◦ as recommended in [4], that is:

![equation3](https://user-images.githubusercontent.com/15813546/31584981-3d7e1e38-b1c6-11e7-9ab6-6e0693d38e78.jpg)

and following values of frequencies as recommended in [6]
![equation4](https://user-images.githubusercontent.com/15813546/31584990-652c251a-b1c6-11e7-9026-3e729f550684.jpg)

where ![equation5](https://user-images.githubusercontent.com/15813546/31585017-c9891d9c-b1c6-11e7-8b4d-4125f0c151cc.jpg), Nc is the width of image which is a power of 2. Note that ![equation6](https://user-images.githubusercontent.com/15813546/31585024-e950a26c-b1c6-11e7-8066-9ca836cfc5ba.jpg)
and ![equation7](https://user-images.githubusercontent.com/15813546/31585032-f6106a64-b1c6-11e7-855d-e1530a86f5c9.jpg).

