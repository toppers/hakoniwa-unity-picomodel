using Hakoniwa.PluggableAsset.Assets.Robot.Parts;
using Hakoniwa.PluggableAsset.Communication.Connector;
using Hakoniwa.PluggableAsset.Communication.Pdu;
using Hakoniwa.PluggableAsset.Assets.Robot;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

namespace Hakoniwa.PluggableAsset.Assets.Robot.Parts.TestDriver
{
    public class PicoLightSensorTestDriver : MonoBehaviour, IRobotPartsSensor, IRobotPartsConfig
    {
        private GameObject root;
        private PduIoConnector pdu_io;
        private IPduWriter pdu_writer;
        private string root_name;
        public bool isTouched = false;

        public int update_cycle = 1;
        public string topic_name = "light_sensor";
        public string roboname = "PicoModel";
        public RosTopicMessageConfig[] getRosConfig()
        {
            return new RosTopicMessageConfig[0];
        }

        public void Initialize(System.Object obj)
        {
            GameObject tmp = null;
            try
            {
                tmp = obj as GameObject;
            }
            catch (InvalidCastException e)
            {
                Debug.LogError("Initialize error: " + e.Message);
                return;
            }

            if (this.root == null)
            {
                this.root = tmp;
                this.root_name = string.Copy(this.root.transform.name);
                this.pdu_io = PduIoConnector.Get(roboname);
                if (this.pdu_io == null)
                {
                    throw new ArgumentException("can not found pdu_io:" + root_name);
                }
                var pdu_writer_name = roboname + "_" + this.topic_name + "Pdu";
                this.pdu_writer = this.pdu_io.GetWriter(pdu_writer_name);
                if (this.pdu_writer == null)
                {
                    throw new ArgumentException("can not found pdu_writer:" + pdu_writer_name);
                }
            }
        }

        public bool isAttachedSpecificController()
        {
            return false;
        }
        public short foward_r;
        public short foward_l;
        public short left;
        public short right;
        public void UpdateSensorValues()
        {
            this.foward_r = this.pdu_writer.GetReadOps().GetDataInt16("forward_r");
            this.foward_l = this.pdu_writer.GetReadOps().GetDataInt16("forward_l");
            this.left = this.pdu_writer.GetReadOps().GetDataInt16("left");
            this.right = this.pdu_writer.GetReadOps().GetDataInt16("right");
        }
        public RoboPartsConfigData[] GetRoboPartsConfig()
        {
            return new RoboPartsConfigData[0];
        }

    }
}