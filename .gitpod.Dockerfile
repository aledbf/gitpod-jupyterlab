FROM gitpod/workspace-full

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && sudo bash Miniconda3-latest-Linux-x86_64.sh -p /miniconda -b \
    && rm Miniconda3-latest-Linux-x86_64.sh \
    && sudo chown -R gitpod:gitpod /miniconda

ENV PATH=$PATH:/miniconda/bin/

RUN conda install --yes cudatoolkit=11.0 cudnn=8.0 -c=conda-forge \
    && pip install --upgrade tensorflow-gpu==2.4.1 \
    && pip install ipykernel \
    && python -m ipykernel install --user --name tf_gpu --display-name "TensorFlowGPU" \
    && conda install --yes jupyterlab \
    && pip install keras
