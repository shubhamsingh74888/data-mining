
from sklearn.cluster import KMeans
from sklearn.datasets import load_iris
import matplotlib.pyplot as plt
from sklearn.decomposition import PCA


iris = load_iris()
X = iris.data  # Feature data
y = iris.target  # Actual labels (not used in unsupervised learning)


kmeans = KMeans(n_clusters=3, random_state=42)
kmeans.fit(X)


labels = kmeans.labels_
centroids = kmeans.cluster_centers_

pca = PCA(n_components=2)
X_pca = pca.fit_transform(X)


plt.figure(figsize=(8, 5))
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=labels, cmap='viridis', marker='o', label='Data Points')
plt.scatter(pca.transform(centroids)[:, 0], pca.transform(centroids)[:, 1], 
            c='red', marker='x', s=200, label='Centroids')
plt.title('K-Means Clustering on Iris Dataset')
plt.xlabel('PCA Component 1')
plt.ylabel('PCA Component 2')
plt.legend()
plt.grid(True)
plt.show()
