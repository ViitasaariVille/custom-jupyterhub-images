#FROM image-registry.openshift-image-registry.svc:5000/aiplatform-tekton-build/s2i-generic-data-science-notebook:v0.0.2
FROM quay.io/thoth-station/ps-cv-pytorch:v0.1.1

USER 0

USER 1000
