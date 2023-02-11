FROM gitpod/workspace-full

RUN curl -LO http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    && bash Miniconda3-latest-Linux-x86_64.sh -p /workspace/miniconda -b \
    && Miniconda3-latest-Linux-x86_64.sh

ENV PATH=$PATH:/workspace/miniconda/bin/

RUN conda install --yes cudatoolkit=11.0 cudnn=8.0 -c=conda-forge \
    && pip install --upgrade tensorflow-gpu==2.4.1 \
    && pip install ipykernel \
    && python -m ipykernel install --user --name tf_gpu --display-name "TensorFlowGPU" \
    && conda install --yes jupyterlab \
    && pip install keras
