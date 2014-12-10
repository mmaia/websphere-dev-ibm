# version 1 - WebSphere for Developers install on a docker container. The base image used already contains Installation Manager installed. Check my previous post to
# see how the base image was generated: https://www.ibm.com/developerworks/community/blogs/devTips/entry/ibm_installation_manager_in_silent_mode_no_x_on_linux_quick_reference?lang=en
# WebSphere for developer can be downloaded from IBM web site: http://www.ibm.com/developerworks/downloads/ws/wasdevelopers/
# by mmaia - mpais@br.ibm.com, maia.marcos@gmail.com
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
#
# +------------------------------------------------------------------------+
# | Licensed Materials - Property of IBM                                   |
# | (C) Copyright IBM Corp. 2010, 2011.  All Rights Reserved.              |
# |                                                                        |
# | US Government Users Restricted Rights - Use, duplication or disclosure |
# | restricted by GSA ADP Schedule Contract with IBM Corp.                 |
# +------------------------------------------------------------------------+
FROM mmaia/im_ibm:v1
MAINTAINER Marcos Maia "mpais@br.ibm.com / maia.marcos@gmail.com"

#copy files to docker image
COPY *.zip tmp/

#preparing the files to install, unzipping and creating correct directory structures for WAS and IBM JDK and deleting the
#zip files that are not necessary anymore so disk image doesn't get without space
RUN cd tmp && mkdir was && mkdir jdk && unzip was_part1.zip -d was && rm -rf was_part1.zip && unzip was_part2.zip -d was  \
    && rm -rf was_part2.zip && unzip was_part3.zip -d was && rm -rf was_part3.zip \
    && unzip was.java7_part1.zip -d jdk && rm -rf was.java7_part1.zip && unzip was.java7_part2.zip -d jdk && rm -rf was.java7_part2.zip \
    && unzip was.java7_part3.zip -d jdk && rm -rf was.java7_part3.zip
